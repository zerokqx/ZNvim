return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.sources.default = { "lsp" }

    if opts.sources.providers.buffer then
      opts.sources.providers.buffer.score_offset = -100
    end

    return opts
  end,
}
