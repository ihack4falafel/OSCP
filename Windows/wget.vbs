strUrl = WScript.Arguments.Item(0) 
StrFile = WScript.Arguments.Item(1) 
Const HTTPREQUEST_PROXYSETTING_DEFAULT = 0
Const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0 
Const HTTPREQUEST_PROXYSETTING_DIRECT = 1 
Const HTTPREQUEST_PROXYSETTING_PROXY = 2 
Dim http, varByteArray, strData, strBuffer, lngCounter, fs, ts 
Err.Clear  
Set http = Nothing
Set http = CreateObject("WinHttp.WinHttpRequest.5.1")
If http Is Nothing Then Set http = CreateObject("WinHttp.WinHttpRequest") 
If http Is Nothing Then Set http = CreateObject("MSXML2.ServerXMLHTTP")  
If http Is Nothing Then Set http = CreateObject("Microsoft.XMLHTTP") 
http.Open "GET", strURL, False  
http.Send 
varByteArray = http.ResponseBody 
Set http = Nothing  
Set fs = CreateObject("Scripting.FileSystemObject") 
Set ts = fs.CreateTextFile(StrFile, True)  
strData = "" 
strBuffer = "" 
For lngCounter = 0 to UBound(varByteArray)
ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1, 1)))  
Next  
ts.Close  
