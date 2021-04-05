pacman::p_load('showtext') # if you're on a newish Mac, you'll need XQuartz installed.
# font_add_google("Open Sans", "opensans")
# font_add_google("Overpass", "overpass")
# font_add_google("Roboto Mono", "robotomono")
# font_add_google("Nunito Sans", "nunito")
# font_add_google("Ubuntu", "ubuntu")
# font_add_google("Karla", "karla")

get_styles <- function(s) {
  if (s=="grist") {
    pts <- "#C3C3C3"
    ln <- "#ff7700"
    highlight <- "#0f9bff"
    font_add_google("Open Sans", "Open Sans")
    font_text <- "Open Sans"
    font_num <- "Open Sans"
    face <- "plain"
    shape <- 1
    shapesize <- 2.5
    alpha <- 1
  } else {
    pts <- "#cccccc"
    #ln <- "#ff9999"
    ln <- "#4be3de"
    highlight <- "#ffcc99"
    font_text <- "Franklin Gothic Demi"
    font_num <- "Franklin Gothic Demi"
    face <- "italic"
    shape <- 16
    shapesize <- 3
    alpha <- .66
  }
  styles <- list(pts=pts,
                 ln=ln,
                 highlight=highlight,
                 font_text=font_text,
                 font_num=font_num,
                 face=face,
                 shape=shape,
                 shapesize=shapesize,
                 alpha=alpha)
  return(styles)
}

styles <- get_styles(style)
showtext_auto()

gristify <- function() {
  ggplot2::theme(
    # Text
    plot.title = ggplot2::element_text(
      family = styles$font_text,
      size = 19,
      face = "bold",
      color = "#222222"
    ),
    plot.title.position = "plot",
    plot.subtitle = ggplot2::element_text(
      family = styles$font_text,
      size = 17,
      margin = ggplot2::margin(3, 0, 20, 0)
    ),
    plot.caption = ggplot2::element_text(
      family = styles$font_text,
      size = 9,
      face = styles$face,
      hjust = 0,
      color = "#666666"
    ),
    plot.caption.position = "plot",
    
    # Legend
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(
      family = styles$font_num,
      size = 14,
      color = "#666666"
    ),
    
    # Axes
    axis.title = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(
      family = styles$font_num,
      size = 12,
      color = "#666666"
    ),
    axis.title.y = ggplot2::element_text(family = styles$font_num,
                                         size = 12,
                                         color = "#666666"),
    axis.title.x = ggplot2::element_text(family = styles$font_num,
                                         size = 12,
                                         color = "#666666"),
    axis.text.x = ggplot2::element_text(margin = ggplot2::margin(5, b = 10)),
    axis.ticks.x = ggplot2::element_line(size = 0.25,
                                         color = "#222222"),
    axis.line.x = ggplot2::element_line(color = "#222222"),
    axis.ticks.y = ggplot2::element_blank(),
    axis.line.y = ggplot2::element_blank(),
    
    
    # Gridlines
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color = "#F7F7F7"),
    panel.grid.major.x = ggplot2::element_blank(),
    
    # Background
    panel.background = ggplot2::element_blank(),
    
    # Strip background (facet-wrapped plots)
    strip.background = ggplot2::element_rect(fill = "transparent"),
    strip.text = ggplot2::element_text(size  = 22,  hjust = 0),
    
    # Margins
    plot.margin = unit(c(.2, .2, .2, .2), "in")
    
  )
}
