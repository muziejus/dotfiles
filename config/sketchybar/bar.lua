local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 30,
  color = colors.bar.bg,
  border_color = colors.bar.border,
  shadow = true,
  sticky = true,
  padding_right = 18,
  padding_left = 18,
  margin = 10,
  topmost="window",
})
