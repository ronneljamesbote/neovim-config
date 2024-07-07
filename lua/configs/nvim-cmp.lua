return {
  config = function(_, opts)
    local cmp = require "cmp"

    local sources = {}

    for _, v in pairs(opts.sources) do
      table.insert(sources, v)
    end

    local newSources = {
      { name = "copilot" },
      { name = "neorg" },
    }

    for _, v in pairs(newSources) do
      table.insert(sources, v)
    end

    opts.sources = cmp.config.sources(sources)

    cmp.setup(opts)
  end,
}
