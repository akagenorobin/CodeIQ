#! /usr/bin/ruby
# -*- coding: utf-8 -*-

class Ticket
  def initialize(country, from_month, from_day, to_month, to_day)
    if from_month > to_month
      abort("Invalid request: from_month == #{from_month} > to_month == #{to_month}")
    elsif from_month == to_month and from_day >= to_day
      abort
    end
    @country, @range = country, Range.new(from_month * 100 + from_day, to_month * 100 + to_day)
  end
  def first
    @range.first
  end
  def last
    @range.last
  end
  def include?(e)
    @range.include?(e)
  end
  def size
    @range.size
  end
  def conflict?(r)
    self.include?(r.first) || self.include?(r.last) || r.include?(self.first) || r.include?(self.last)
  end
  def to_s
    @country + '(' + @range.to_s + ')'
  end
  attr_reader :country
end

class Solver
  def initialize(filename)
    @requests = []
    File::open(filename) do |f|
      while line = f.gets
        line.chomp!
        if line.match(/^(\S+)\s+(\d+)\/(\d+)-(\d+)\/(\d+)/)
          country, from_month, from_day, to_month, to_day = $1, $2.to_i, $3.to_i, $4.to_i, $5.to_i
          @requests << Ticket.new(country, from_month, from_day, to_month, to_day)
        else
          abort("ERROR:#{line}")
        end
      end
    end
  end

  # 終了日の早いものから順に選ぶ（最善）
  def solve1
    rs = @requests.sort { |a, b| a.last <=> b.last }
    result = []
    while !rs.empty?
      r = rs.shift
      rs.delete_if { |e| e.conflict?(r) }
      result << r
    end
    result.size.to_s + ' ' + result.map {|r| r.country }.sort.join(' ')
  end

  # 開始日が早いものから順に選ぶ
  def solve2
    rs = @requests.sort { |a, b| a.first <=> b.first }
    result = []
    while !rs.empty?
      r = rs.shift
      rs.delete_if { |e| e.conflict?(r) }
      result << r
    end
    result.size.to_s + ' ' + result.map {|r| r.country }.sort.join(' ')
  end

  # 期間が短いものから順に選ぶ
  def solve3
    rs = @requests.sort { |a, b| a.size <=> b.size }
    result = []
    while !rs.empty?
      r = rs.shift
      rs.delete_if { |e| e.conflict?(r) }
      result << r
    end
    result.size.to_s + ' ' + result.map {|r| r.country }.sort.join(' ')
  end

  # できるだけ重なりの少ないものから順に選ぶ
  def solve4
    conflict_count = Hash.new(0)
    @requests.each do |r|
      rs = @requests.clone
      conflict_count[r.country] = rs.keep_if { |s| r.conflict?(s) }.size
    end
    rs = @requests.sort { |a, b| conflict_count[a.country] <=> conflict_count[b.country] }
    result = []
    while !rs.empty?
      r = rs.shift
      rs.delete_if { |e| e.conflict?(r) }
      result << r
    end
    result.size.to_s + ' ' + result.map {|r| r.country }.sort.join(' ')
  end
end

# puts Solver.new("tickets.txt").solve1
# puts Solver.new("tickets.txt").solve2
# puts Solver.new("tickets.txt").solve3
# puts Solver.new("tickets.txt").solve4
puts
puts "answer for five.txt:"
puts Solver.new("five.txt").solve1
puts
puts "answer for tickets.txt"
puts Solver.new("tickets.txt").solve1
