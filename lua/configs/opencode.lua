return {
  keys = {
    {
      "<leader>oa",
      function()
        local opencode_port = 4096
        local chan = vim.fn.sockconnect("tcp", "127.0.0.1:" .. opencode_port, { rpc = false })
        if chan == 0 then
          vim.notify("Start opencode first: `opencode --port 4096`", vim.log.levels.ERROR)
          return
        end

        vim.fn.chanclose(chan)
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Ask opencode…",
    },
  },
  config = function()
    local opencode_port = 4096

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        port = opencode_port,
        start = function()
          vim.notify("opencode server is not running", vim.log.levels.ERROR)
        end,
        toggle = function()
          vim.notify("Embedded terminal is disabled for opencode", vim.log.levels.ERROR)
        end,
        stop = function() end,
      },
    }

    vim.o.autoread = true -- Required for `opts.events.reload`
  end,
}
