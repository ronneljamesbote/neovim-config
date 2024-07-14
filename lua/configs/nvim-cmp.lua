local function getModifiedSources(existingSources)
  local sources = {}

  for _, v in pairs(existingSources) do
    table.insert(sources, v)
  end

  local newSources = {
    { name = "copilot" },
    { name = "neorg" },
  }

  for _, v in pairs(newSources) do
    table.insert(sources, v)
  end

  return sources
end

local function getModifiedMappings(existingMappings)
  local mappings = {}

  for i, v in pairs(existingMappings) do
    if i == "<Tab>" or i == "<S-Tab>" then
      goto continue
    end

    mappings[i] = v
    ::continue::
  end

  return mappings
end

return {
  config = function(_, opts)
    local cmp = require "cmp"

    opts.sources = cmp.config.sources(getModifiedSources(opts.sources))
    opts.mapping = getModifiedMappings(opts.mapping)

    cmp.setup(opts)
  end,
}
