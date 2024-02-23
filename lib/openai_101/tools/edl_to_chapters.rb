# frozen_string_literal: true

module Openai101
  module Tools
    # Convert EDL to YouTube description chapters
    class EdlToChapters
      attr_reader :content

      def initialize(content: nil, file: nil)
        @content = content
        @content = File.read(file) if file
      end

      def convert
        # TITLE: a36
        # FCM: NON-DROP FRAME

        # 001  001      V     C        00:00:09:16 00:00:09:17 00:00:09:16 00:00:09:17
        #  |C:ResolveColorBlue |M:Hey Code Voice Commands |D:1

        # 002  001      V     C        00:00:53:13 00:00:53:14 00:00:53:13 00:00:53:14
        #  |C:ResolveColorBlue |M:Keyboard Shortcuts |D:1

        # 003  001      V     C        00:01:17:20 00:01:17:21 00:01:17:20 00:01:17:21
        #  |C:ResolveColorBlue |M:Create code using voice |D:1

        # 004  001      V     C        00:02:17:25 00:02:17:26 00:02:17:25 00:02:17:26
        #  |C:ResolveColorBlue |M:Next steps |D:1

        chapters = []
        chapter = nil
        content.each_line do |line|
          line = line.strip

          if line =~ /^\d{3}/
            chapter = build_chapter(line)
            chapters << chapter
            next
          end

          chapter[:description] = line.match(/\|M:(.+?)\|/)[1].strip if chapter && line.match(/\|M:(.+?)\|/) && line.match(/\|M:(.+?)\|/)[1]
        end
        chapters.map { |item| "#{item[:time]} #{item[:description]}" }.join("\n")
      end

      def build_chapter(line)
        time_code = line.split(/\s+/)[5] # Extract time code
        hours, minutes, seconds, frames = time_code.split(':').map(&:to_i)
        total_seconds = (hours * 3600) + (minutes * 60) + seconds + (frames / 30.0)
        formatted_time = format('%<hours>02d:%<minutes>02d:%<seconds>02d', hours: total_seconds / 3600, minutes: (total_seconds / 60) % 60, seconds: total_seconds % 60)

        { time: formatted_time }
      end
    end
  end
end
