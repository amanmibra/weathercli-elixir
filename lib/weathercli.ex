defmodule WeatherCLI do
  use ExCLI.DSL, escript: true, mix_task: :sample

 name "weathercli"
 description "CLI to tell you the weather"
 long_description """
 This is my long description
 """

 option :verbose,
   help: "Increase the verbosity level",
   aliases: [:v],
   count: true

 command :hello do
   aliases [:hi]
   description "Greets the user"
   long_description """
   Gives a nice a warm greeting to whoever would listen
   """

   argument :name
   option :from, help: "the sender of hello"

   run context do
     if context.verbose >= 1 do
       IO.puts("I am going to emit a greeting.")
     end
     if from = context[:from] do
       IO.write("#{from} says: ")
     end
     IO.puts("Hello #{context.name}!")
    end
 end
end
