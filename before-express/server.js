const http = require('http');
const fs = require('fs');
const open = require('open');


open('http://localhost:3000');


const getFileAndStatusCode = (url) => {
    let file;
    let statusCode;
    const optionalFolderPath = process.argv[2];
    const folderPath = optionalFolderPath || '.';

    try {
        if (url.includes('.')) {
            file = fs.readFileSync(folderPath + url);
        }
        else {
            file = fs.readFileSync(folderPath + url + '/index.html');
        }
        statusCode = 200;
    }
    catch(err) {
        file = fs.readFileSync('./not-found.html');
        statusCode = 404;
    }

    return {file, statusCode};
}


const getContentType = (url) => {
    let contentType;

    url.includes('.css')
        ? contentType = 'text/css'
        : contentType = 'text.html'

    return contentType;
}


const handleRequest = (req) => {
    const { file, statusCode } = getFileAndStatusCode(req.url);
    const contentType = getContentType(req.url);

    return { statusCode, contentType, file };
}


const server = http.createServer((req, res) => {
    const { statusCode, contentType, file } = handleRequest(req);

    res.writeHead(statusCode, {'Content-Type': contentType});
    res.write(file);
    res.end();
})


server.listen(3000);
