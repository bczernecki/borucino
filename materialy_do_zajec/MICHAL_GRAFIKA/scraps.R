## HEATMAP
Załóżmy, że interesuje nas jak będa wyglądały te przekroczenia w cyklu rocznym ale i w poszczegolnych latach. 

Przygotujmy zatem nową tabelę.
```{r}
drop_na(am8) %>%
  group_by(DATE) %>%
  summarize(PM10d = mean(PM10)) %>%
  mutate(PM10ex = ifelse(PM10d>50, 1, 0)) -> df

df$MONTH = lubridate::month(df$DATE)
df$YEAR = lubridate::year(df$DATE)

table = table(df$PM10ex, df$MONTH, df$YEAR)
```



```{r}
heatmap(table[2, , ], Rowv = NA, Colv = NA, col = cm.colors(256) )

```
