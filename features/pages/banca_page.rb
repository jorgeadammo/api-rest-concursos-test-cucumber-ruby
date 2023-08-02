class Banca
    include HTTParty
    require_relative '../hooks/banca_hook'
    base_uri "http://localhost:8095/api-cnc"
     
    def initialize(body)
      @options = {:body => body}
      @options2 ={}
      @options3 ={:body => body, :headers => {'Content-Type' => 'application/json'}}
    end
  
    def postBanca
      self.class.post("/banca", @options3)
    end

    def getBanca (id)
      self.class.get("/banca/#{id}", @options2)
    end

    def putBanca (id)
      self.class.put("/banca/#{id}", @options3)
    end

    def deleteBanca (id)
      self.class.delete("/banca/#{id}", @options2)
    end
  end