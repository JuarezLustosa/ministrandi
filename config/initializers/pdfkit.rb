PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :encoding      => 'UTF-8',
    :page_size     => 'A4',
    :margin_top    => '0.5in',
    :margin_right  => '0.5in',
    :margin_bottom => '0.7in',
    :margin_left   => '0.5in'
  } 
  config.root_url = "http://localhost"
  config.verbose = false
end