class ComplexNum
    @@add_state=0
    @@multi_state=0
   
    @@bulk_add_state=0
    @@bulk_multi_state=0
    def initialize(real,imagenary)
        @real=real
        @imagenary=imagenary
     
    end    
    def +(other)
        comp=ComplexNum.new(0,0)
        @@add_state=@@add_state+1
        comp.real = @real + other.real
        comp.imagenary = @imagenary + other.imagenary
        return comp
    end
    def *(other)
        @@multi_state=@@multi_state+1
        comp=ComplexNum.new(1,0)
        # new_real = @real * other.real - imagenary * other.imagenary
        # @imagenary = @imagenary * other.real + @real * other.imagenary
        # @real = new_real
        comp.real=((@real*other.real)-(@imagenary*other.imagenary))
        comp.imagenary=((@real*other.imagenary)+(@imagenary*other.real))
        return comp

    end    
    attr_accessor :real, :imagenary
    def self.bulk_add(args)
        @@bulk_add_state=@@bulk_add_state+1
        comp=ComplexNum.new(0,0)
        args.each do |elem|
            comp.real= comp.real+elem.real
            comp.imagenary=comp.imagenary+elem.imagenary
           
       
        end
       
        return comp    
    end 
    def self.bulk_multi(args)
        comp=ComplexNum.new(1,0)
        @@bulk_multi_state=@@bulk_multi_state+1
        args.each do |elem|
        #  ((comp.real*elem.real)-(comp.imagenary*elem.imagenary))+((comp.real*elem.imagenary)+(comp.imagenary*elem.real))
            new_real = comp.real * elem.real - comp.imagenary * elem.imagenary
            comp.imagenary = comp.imagenary * elem.real + comp.real * elem.imagenary
            comp.real = new_real
        

        end 
       
        return comp 
    end
    def self.get_state
        puts "add state :" +@@add_state.to_s
        puts "multi state :" + @@multi_state.to_s
        puts "bulk_multi state :" + @@bulk_multi_state.to_s
        puts "bulk_add state :" + @@bulk_add_state.to_s
    end   
end   
com=ComplexNum.new(3,2) 
com2=ComplexNum.new(1,7) 
# com3=ComplexNum.new(1,2i)
coo= com + com2
puts "#{coo.real}+#{coo.imagenary}i"
com5=com*com2
puts "#{com5.real}+#{com5.imagenary}i"
com3=ComplexNum.bulk_add([com2])
puts "#{com3.real}+#{com3.imagenary}i"
com4=ComplexNum.bulk_multi([com2,com])
puts "#{com4.real}+#{com4.imagenary}i"
ComplexNum.get_state
 