#!/usr/bin/python3
# tracing.py
from opentelemetry import trace,baggage
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import (
            BatchSpanProcessor,
                ConsoleSpanExporter,
                )

provider = TracerProvider()
processor = BatchSpanProcessor(ConsoleSpanExporter())
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)


tracer = trace.get_tracer(__name__)

## original for reference
#with tracer.start_as_current_span("foo"):
#     with tracer.start_as_current_span("bar"):
#          with tracer.start_as_current_span("baz"):
#                print("Hello world from OpenTelemetry Python!")

context_demo = baggage.set_baggage("context","global")
## https://opentelemetry-python.readthedocs.io/en/latest/sdk/trace.html
## https://opentelemetry.io/docs/reference/specification/overview/
with tracer.start_as_current_span("baz",context=context_demo,attributes={"foo":"bar","bar":"foo","random":1}):
     print("Hello world from OpenTelemetry Python!")
