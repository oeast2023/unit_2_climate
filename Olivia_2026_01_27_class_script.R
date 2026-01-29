# Olivia_2026_01_27
# class script

#read in data
#complete path name starts with root (/), relative directory path if just starts with file name
#just use relative directory b/c file will not exist when Dr. MG downloads
# col.names = manually give columns names

ant_ice_loss = read.table(file="data/antarctica_mass_200204_202505.txt", skip = 31,
sep = "",header = F, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))
ant_ice_loss
grn_ice_loss = read.table(file="data/greenland_mass_200204_202505.txt", skip = 31, header = F, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))
grn_ice_loss
head(grn_ice_loss)
dim(ant_ice_loss)
summary(grn_ice_loss)

# plot
range(grn_ice_loss$mass_Gt)

plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss$mass_Gt,
type = "l",
xlab="",
ylab="Ice mass loss (Gt)")
lines(x=grn_ice_loss$decimal_date, y=grn_ice_loss$mass_Gt,
ylim = range(grn_ice_loss$mass_Gt),
type = "l",
xlab="",
ylab="Ice mass loss (Gt)",
col="red")

plot(mass_Gt ~ decimal_date,
    data = ant_ice_loss,
    ylab = "Antarctica Mass Loss (Gt)")

plot(mass_Gt ~ decimal_date,
    data = grn_ice_loss,
    ylab = "Greenland Mass Loss (Gt)")

lines(mass_Gt ~ decimal_date,
      data=grn_ice_loss,
    type = "l",
    xlab="",
    col="red")

# add a break between grace missions
# rbind = combines data set by rows
# head = takes first 6 rows of data set
# tail = takes last 6 rows of data set
# order = orgnanizes data

data_break = data.frame(decimal_date = 2018,
                        mass_Gt = NA,
                      sigma_Gt = NA)

data_break
ant_ice_loss_NA = rbind(ant_ice_loss, data_break)
head(ant_ice_loss_NA)
tail(ant_ice_loss_NA)

ant_ice_loss$decimal_date
order(ant_ice_loss_NA$decimal_date)

ant_ice_loss_NA = ant_ice_loss_NA[order(ant_ice_loss_NA$decimal_date),]
tail(ant_ice_loss_NA)

# do it to greenland
grn_ice_loss_NA = rbind(ant_ice_loss, data_break)
grn_ice_loss_NA = grn_ice_loss_NA[order(grn_ice_loss_NA$decimal_date),]

plot(mass_Gt ~ decimal_date,
  data = ant_ice_loss_NA,
  ylim = range(grn_ice_loss$mass_Gt),
    type = "l",
    xlab="",
    ylab="Ice mass loss (Gt)") 
lines(((sigma_Gt * 2) + mass_Gt) ~ decimal_date, data = ant_ice_loss_NA, lty = "dashed") 
lines((mass_Gt - sigma_Gt*2) ~ decimal_date, data = ant_ice_loss_NA, lty = "dashed") 
lines(mass_Gt ~ decimal_date,
      data=grn_ice_loss_NA,
    type = "l",
    xlab="",
    col="red")

min(ant_ice_loss$mass_Gt)
min(grn_ice_loss$mass_Gt)

# open up a plotting device
pdf("figures/ice_mass_trends.pdf", width = 7, height = 5)

# create the figure
barplot(height = c(min(ant_ice_loss$mass_Gt), min(grn_ice_loss$mass_Gt))*(-1),
  names.arg = c("Antarctica", "Greenland"))

#close the plotting device
dev.off()