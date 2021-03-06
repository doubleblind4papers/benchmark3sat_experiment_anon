

rm(list=ls())
# ==============================================
library(ggplot2)
library(scales)
# ==============================================

# ==============================================
read_sat_report <- function(file_path) {
  # ==============================================
  report <- read.table(file=file_path, 
                       header = FALSE, 
                       sep = ",",
                       blank.lines.skip = TRUE, 
                       fill = TRUE)
  
  names(report) <- as.matrix(report[1, ])
  report <- report[-1, ]
  report[] <- lapply(report, function(x) type.convert(as.character(x)))
  report
}
# ==============================================


geom_ptsize = 1
geom_stroke = 1
geom_shape = 19

make_plot_diagram <- function(report_file_str,plot_title_str) {
  report_data <- read_sat_report(report_file_str)
  
  g <- ggplot(report_data, aes(x=varisat_time, y=ourtool_time, color=varisat_res)) +
    geom_point(size = geom_ptsize, stroke = geom_stroke, shape = geom_shape) + 
    labs(colour = "isSAT", x = "varisat time", y = "ourtool time") +
    ggtitle(plot_title_str) +
    theme(plot.title = element_text(margin = margin(b = -25)),
          axis.title.x = element_text(margin = margin(t = 5)),
          axis.title.y = element_text(margin = margin(r = 5)))
  g
  (g + scale_color_manual(values=c("False" = "red", "True" = "blue")))
}

make_plot_diagram("./sat_membership_experiment_custom.csv", 
                  "Custom")

make_plot_diagram("./sat_membership_experiment_uf20.csv",
                  "UF20")

uf20 <- read_sat_report("./sat_membership_experiment_uf20.csv")

mean(uf20$ourtool_time)
mean(uf20$varisat_time)
max(uf20$ourtool_time)
summary(uf20$varisat_time)
summary(uf20$ourtool_time)
sd(uf20$varisat_time)
sd(uf20$ourtool_time)

