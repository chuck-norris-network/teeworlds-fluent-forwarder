module.exports = {
  host: process.env.TW_HOST or 'localhost'
  port: parseInt process.env.TW_PORT or 8303
  password: process.env.TW_PASSWORD
}
