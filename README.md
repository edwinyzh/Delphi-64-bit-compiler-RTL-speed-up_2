# Delphi-64-bit-compiler-RTL-speed-up_2
Updated to stable branch Intel IPP TBB 24 march 2021

Delphi 64 bit compiler MM, RTL, WEB patches for performance

Object Pascal wrappers from Intel Integrated Performance Primitives and Intel Threading Building Blocks royalty-free packages

https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/ipp.html<br>
https://github.com/oneapi-src/oneTBB

Copyright 24 March 2021 Roberto Della Pasqua

This folder contains:

D64TBB.dll lock-free scalable allocator

D64IPP.dll simd enabled rtl subset routines

D64ZIP.dll accelerated zlib deflate compression

D64TBB64.pas wrapper for memory manager (put this unit as first unit clause in project source)

D64IPP.pas wrapper for simd rtl

D64ZLIB.pas wrapper for zlib compression

D64WB.pas utils to enhance webbroker

License.txt for legal terms

If you want to enable zlib speed up into your WebBroker apps, add one line of code in AfterDispatch event:

procedure TWebModule.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
Response.ZlibDeflate;
end;
The library is well tested, but if you found any trouble please notify me.

Thank you and best regards

Roberto Della Pasqua
