---@diagnostic disable: undefined-global

return {
	s("date", t(os.date("%Y/%m/%d"))),
	s("mail", t("pdllerenas@gmail.com")),
	s("email", t("pedro.llerenas@cimat.mx")),
	s("gh", t("github.com/pdllerenas")),
	s("(", { t("("), i(1), t(")") }),
	s("[", { t("["), i(1), t("]") }),
	s("{", { t("{"), i(1), t("}") }),
	s("$", { t("$"), i(1), t("$") }),
}
