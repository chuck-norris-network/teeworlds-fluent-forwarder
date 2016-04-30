module.exports = {
  host: process.env.FLUENT_HOST or 'localhost'
  port: parseInt process.env.FLUENT_PORT or 24224
  tagPrefix: process.env.TAG_PREFIX or 'teeworlds'
}
