local function get_intelephense_license()
  local f = assert(io.open(os.getenv 'HOME' .. '/intelephense/licence.txt', 'rb'))
  local content = f:read '*a'
  f:close()
  return string.gsub(content, '%s+', '')
end

return {
  filetypes = { 'php' },
  root_markers = { 'composer.json' },
  init_options = {
    licenseKey = get_intelephense_license(),
  },
}
