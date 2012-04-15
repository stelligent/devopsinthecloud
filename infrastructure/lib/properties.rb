require 'rubygems'

def read_properties(data)
    data = data.read if data.class < IO

    ret = {}
    data.each_with_index do |line, i|
        next if line =~ /^\s*[#!]/
        raise "Invalid line [#{i+1}]: #{line}" unless line =~ /[=:]/
        ret.store(*line.strip.split(/[=:]/, 2).map(&:strip))
    end
    ret
end
