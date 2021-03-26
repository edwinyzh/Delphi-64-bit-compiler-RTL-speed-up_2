program TestWebbroker;
{$APPTYPE GUI}

uses
  D64TBB,
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormS2 in 'FormS2.pas' {FormServer},
  WebModuleUnitS2 in 'WebModuleUnitS2.pas' {WebModule3: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
