require("obsidian").setup {
  workspaces = {
    {
      name = "personal",
      path = "~/Nextcloud/vault"
    }
  },
  notes_subdir = "000-notes",
  daily_notes = {
    folder = "002-journal",
    template = "meta/templates/journal/daily-template.md",
    date_format = "%Y-%m-%d"
  },
  templates = {
    subdir = "meta/templates"
  },
  attachments = {
    img_folder = "assets/images"
  },
  -- completion = {
  --	prepend_note_id = false
  -- },
  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,
  note_frontmatter_func = function(note)
    local out = { tags = note.tags }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,
}
