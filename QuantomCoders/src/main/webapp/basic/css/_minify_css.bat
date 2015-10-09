
for %%i in (.\*.css) do call :minify %%~nxi




:minify
java -jar yuicompressor-2.4.7.jar %1 -o min\%1