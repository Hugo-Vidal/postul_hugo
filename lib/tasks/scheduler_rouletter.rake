class Rouletter < ActiveJob::Base
    # @param scheduled_time [Integer] The epoch time for when the job was scheduled to be run
    def ro()
      puts Time.at()
    end
end