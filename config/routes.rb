BreakpointApp::Application.routes.draw do
  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  resources :users, :except => :edit, constraints: FormatTest.new(:json)
  resources :teams, :except => :edit, constraints: FormatTest.new(:json)
  post   'session' => 'session#create'
  delete 'session' => 'session#destroy'

  root 'ember#index', constraints: FormatTest.new(:html)
end

