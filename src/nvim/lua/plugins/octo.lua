local ok, octo = pcall(require, "octo")
if not ok then
  return
end

octo.setup({
  github_token = vim.fn.getenv("GITHUB_TOKEN"),
  enable_builtin = true,
  default_remote = { "upstream", "origin" },
})
