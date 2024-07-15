Grover.configure do |config|
  config.options = {
    format: 'A4',
    margin: {
      top: '1cm',
      bottom: '1cm',
      left: '1cm',
      right: '1cm'
    },
    display_url: 'http://localhost:3000',
    timeout: 60000,
    debug: true
  }
end