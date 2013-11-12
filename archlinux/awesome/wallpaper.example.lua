local gears = require("gears")

wallpaper_folder = "wallpaper"
wallpaper_ext = "jpg"
wallpapers =
{
  (config_dir .. "/wallpaper/2." .. wallpaper_ext),
  (config_dir .. "/wallpaper/3." .. wallpaper_ext),
  (config_dir .. "/wallpaper/1." .. wallpaper_ext),
  (config_dir .. "/wallpaper/4." .. wallpaper_ext)
}

for s = 1, screen.count() do
  wall = wallpapers[s] or wallpapers[1]
  gears.wallpaper.maximized(wall, s, true)
end