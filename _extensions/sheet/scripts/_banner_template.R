make_banner <- function(
    type,
    logo = TRUE,
    last_updated = NULL,
    sheet_title,
    subtitle = "",
    course_code
) {
  # Check sheet type is a valid one
  if (!type %in% c("tutorial", "lab", "bonus")) {
    stop('Invalid type. Valid sheet types are "tutorial", "lab", or "bonus".')
  }
  
  # Create the optional "last updated" block, if needed
  page_info <- if (!is.null(last_updated) &&
                   is.character(last_updated) &&
                   nzchar(last_updated)) {
    paste0(
      "::: {.page-info}\n",
      "Last updated: ", last_updated, "\n",
      ":::\n\n"
    )
  } else {
    ""
  }
  
  logo_part <- if(!is.null(logo) && isTRUE(logo)){
    paste0(
      "::::::{.banner-logo}\n",
      ":::::::::: {.content-hidden when-format=\"pdf\"}\n",
      "![](logo.jpg){fig-alt=\"University of Glasgow logo\"}\n",
      "::::::::::\n",
      "::::::\n",
      "\n"
    )
  } else {
    ""
  }

  cat(paste0(
    page_info,
    "\n",
    "::: {.banner .", type, " role=\"banner\"}\n",
    "\n",
    logo_part,
    "::::::::: {.banner-main}\n",
    "# ", sheet_title, "\n",
    "<p class='banner-subtitle'>", subtitle, "</p>\n",
    ":::::::::\n",
    "\n",
    ":::::: {.banner-right aria-label=\"Course name\" role=\"region\"}\n",
    course_code, "\n",
    "::::::\n",
    "\n",
    ":::\n"
  ))
}
