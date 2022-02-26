package com.epam.rd.jsp.currencies;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Collection;
import java.util.Map;
import java.util.TreeMap;

public class Currencies {
    private Map<String, BigDecimal> curs = new TreeMap<>();

    public void addCurrency(String currency, BigDecimal weight) {
        curs.put(currency, weight);
    }

    public Collection<String> getCurrencies() {
        return curs.keySet();
    }

    public Map<String, BigDecimal> getExchangeRates(String referenceCurrency) {
        
        Map<String, BigDecimal> relativeCurs = new TreeMap<>();
        for(Map.Entry<String,BigDecimal> entry : curs.entrySet()) {
            String key = entry.getKey();
            BigDecimal value = entry.getValue();
            BigDecimal referenceValue = curs.get(referenceCurrency);
            BigDecimal relativeRate = referenceValue.divide(value, 5, RoundingMode.HALF_UP);
            relativeCurs.put(key, relativeRate);
          }
        return relativeCurs;
    }

    public BigDecimal convert(BigDecimal amount, String sourceCurrency, String targetCurrency) {
        BigDecimal sourseValue = curs.get(sourceCurrency);
        BigDecimal targetValue = curs.get(targetCurrency);
        BigDecimal relativeRate = sourseValue.divide(targetValue, 10, RoundingMode.HALF_UP);
        MathContext m = new MathContext(10);
        return amount.multiply(relativeRate, m).setScale(5, RoundingMode.HALF_UP);
        
    }
}
