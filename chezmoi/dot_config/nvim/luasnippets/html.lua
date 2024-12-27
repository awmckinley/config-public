--[[
HTML snippets.
--]]

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		{
			trig = "bp_full",
			desc = "full boilerplate",
		},
		fmt(
			[[
<!DOCTYPE html>
<html lang="en" class="no-js">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{a}</title>
    <script type="module">
      document.documentElement.classList.replace("no-js", "js");
    </script>
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="/print.css" media="print">
    <!-- https://www.semrush.com/blog/meta-description/ -->
    <meta name="description" content="{b}">
    <!-- https://ogp.me/ -->
    <meta property="og:title" content="{a}">
    <meta property="og:description" content="{b}">
    <meta property="og:image" content="/image.jpeg">
    <meta property="og:image:alt" content="Image description">
    <meta property="og:locale" content="en_US">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://example.com/path">
    <!-- https://developer.x.com/en/docs/x-for-websites/cards/overview/summary -->
    <meta name="twitter:card" content="summary">
    <!-- https://www.semrush.com/blog/canonical-url-guide/ -->
    <link rel="canonical" href="https://example.com/path">
    <!-- https://web.dev/articles/building/an-adaptive-favicon -->
    <link rel="icon" href="/favicon.ico">
    <link rel="icon" href="/favicon.svg" type="image/svg+xml">
    <!-- https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <!-- https://developer.mozilla.org/en-US/docs/Web/Manifest -->
    <link rel="manifest" href="/site.webmanifest">
    <!-- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta/name/theme-color -->
    <meta name="theme-color" content="#001F3F">
  </head>
  <body>
	{c}
  </body>
</html>
	]],
			{
				a = i(1, "TITLE"),
				b = i(2, "DESCRIPTION"),
				c = i(0),
			},
			{
				repeat_duplicates = true,
			}
		)
	),

	s(
		{
			trig = "bp_minimal",
			desc = "minimal boilerplate",
		},
		fmt(
			[[
<!DOCTYPE html>
<html lang="en" class="no-js">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{a}</title>
    <script type="module">
      document.documentElement.classList.replace("no-js", "js");
    </script>
  </head>
  <body>
	{b}
  </body>
</html>
	]],
			{
				a = i(1, "TITLE"),
				b = i(0),
			}
		)
	),
}
