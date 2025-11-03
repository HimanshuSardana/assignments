patient_ids <- seq(1, 4)
adm_dates <- c("10/15/2009", "11/1/2009", "10/21/2009", "10/28/2009")
ages <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")

df <- data.frame(
        patient_id = patient_ids,
        adm_date = as.Date(adm_dates, format = "%m/%d/%Y"),
        age = ages,
        diabetes = diabetes,
        status = status
)
print(df)
