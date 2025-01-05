
-- Local override capability, originally devised to allow local overriding of colorscheme
-- on different machines.
-- EXTENSION POINT: add functions to local and call function to override non plugin
-- settings like keymaps, global vim settings and etc
local overrides_enabled, local_overrides = pcall(require, 'local')

local override_or_default = function(override_key, default)
  --  Used in combination with local overrides above within lazy config to
  --  load optionally overriden local values
  if not overrides_enabled or override_key == nil then
    return default
  else
    return local_overrides[override_key]
  end
end

return {
  override_or_default = override_or_default,
}
