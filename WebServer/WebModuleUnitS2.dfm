object WebModule3: TWebModule3
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule3DefaultHandlerAction
    end
    item
      Name = 'test'
      PathInfo = '/test'
      OnAction = WebModule3testAction
    end>
  Height = 230
  Width = 415
end
