class RequestTimeMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    before = Time.now.to_f
    status, headers, body = @app.call env
    time = "#{(Time.now.to_f - before).to_s} sec"

    headers['X-Request-Time'] = time

    [status, headers, body]
  end
end
