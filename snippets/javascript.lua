local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("cfs", {
    t("exports."),
    i(1, "nombreControlador"),
    t(" = async (req, res) => {"),
    t({ "", "  console.log('" }),
    i(2, "NombreModulo"),
    t("."),
    i(3, "nombreServicio"),
    t("');"),
    t({ "", "  try {", "    let result = await " }),
    i(4, "nombreServicio"),
    t("(req);"),
    t({ "", "    return res.status(" }),
    i(5, "200"),
    t({
      ").json({",
      "      success: true,",
      "      body: result",
      "    });",
      "  } catch (error) {",
      "    console.error(error);",
      "    return res.status(",
    }),
    i(6, "400"),
    t({
      ").json({",
      "      success: false,",
      "      body: error.message || error",
      "    });",
      "  }",
      "};",
    }),
  }),
  s("sfs", {
    t("exports."),
    i(1, "nameService"),
    t(" = async (req) => {"),
    t({ "", '  console.log("full.services.' }),
    i(2, "nameClassAndFuntion"),
    t('");'),
    t({ "", "  await connectionDB();" }),
    t({ "", "", "  return {}" }),
    t({ "", "}" }),
  }),
}
