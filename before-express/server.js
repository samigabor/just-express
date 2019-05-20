const http = require('http');
const fs = require('fs');
const open = require('open');


open('http://localhost:3000');


const getFileAndStatusCode = (url) => {
    let file;
    let statusCode;
    // set current folder as default
    const folderPath = process.argv[2] || '.';

    try {
        if (url === '/') {
            file = fs.readFileSync(folderPath + url + 'index.html');
        }
        else {
            file = fs.readFileSync(folderPath + url);
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

    if (url.includes('.css')) {
        contentType = 'text/css';
    }
    else if (url.includes('.png')){
        contentType = 'image/png';
    }
    else if (url.includes('.json')){
        contentType = 'application/json';
    }
    else {
        contentType = 'text/html';
    }

    return contentType;
}


const handleRequestUrl = (url) => {
    const { file, statusCode } = getFileAndStatusCode(url);
    const contentType = getContentType(url);

    return { statusCode, contentType, file };
}


const server = http.createServer((req, res) => {
    const { statusCode, contentType, file } = handleRequestUrl(req.url);

    res.writeHead(statusCode, {'Content-Type': contentType});
    res.write(file);
    res.end();
})


server.listen(3000);
