const http = require('http');

const port = process.env.PORT || 3000;

const server = http.createServer((request, response) => {
  if (request.url === '/health') {
    response.writeHead(200, { 'Content-Type': 'application/json' });
    response.end(JSON.stringify({ status: 'ok' }));
    return;
  }

  response.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  response.end(`
    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Simple Node App</title>
      </head>
      <body>
        <h1>Hello from Node.js!</h1>
        <p>Your simple application is running successfully.</p>
        <p><a href="/health">Check health</a></p>
      </body>
    </html>
  `);
});

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
