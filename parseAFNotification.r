## code to parse some of the important bits from an AFNotification export from PI System Explorer

require(XML)
data<-xmlParse("Notifications.xml")

listDat <-xmlToList(data, addAttributes = F, simplify = T)
names <- sapply(listDat, function (x) x[["Name"]])
targets <- sapply(listDat, function (x) ifelse(is.null(x[["Target"]][["AFElementRef"]]), NA, x[["Target"]][["AFElementRef"]]))
category <- sapply(listDat, function (x) ifelse(is.null(x[["AFElementCategoryRef"]]), NA, x[["AFElementCategoryRef"]]))
priority <- sapply(listDat, function (x) ifelse(is.null(x[["Priority"]]), NA, x[["Priority"]]))
status <- sapply(listDat, function (x) ifelse(is.null(x[["Status"]]), NA, x[["Status"]]))

afNotification<- data.frame(names, targets, category, priority, status)

write.csv(afNotification, file="afNotification")
