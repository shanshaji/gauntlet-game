class Player
	attr_sprite
	attr_accessor :attacked_at, :future_player, :projectiles, :damage, :angle, :x, :y
	def initialize
		@x            = 640
	    @y            = 360
	    @w            = 16
	    @h            = 16
	    @attacked_at  = -1
	    @angle        = 0
	    @path = 'sprites/circle/green.png'
	    @future_player= {
	    	dx: 0, 
	    	dy: 0,
	    	both: {
	    		x:0,
	    		y:0
	    	}
	    }
	    @projectiles  = []
	    @damage       = 0
	end

	def animate tick_count
		if @attacked_at == tick_count
	     @projectiles << Projectile.new(tick_count: tick_count, x: @x, y: @y, angle: @angle)
	    end
	end

  	def future_player_position_new dx, dy
    	new_x = @x + dx
	    new_y = @y + dy 
	    create_future_player(new_x, new_y)
  	end

  	private

  	def create_future_player(x, y)
  		FutureObject.new(x, y, @w, @h)
  	end
end