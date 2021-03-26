unit WebModuleUnitS2;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule3 = class(TWebModule)
    procedure WebModule3DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule3testAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule3.WebModule3DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application '+ FormatDateTime('YYYY-MM-DD hh:mm:ss', Now) +' </body>' +
    '</html>';
end;

procedure TWebModule3.WebModule3testAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application '+ FormatDateTime('YYYY-MM-DD hh:mm:ss', Now) +' </body>' +
    '</html>';
end;

end.
