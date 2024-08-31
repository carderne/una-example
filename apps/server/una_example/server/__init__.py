from starlette.applications import Starlette
from starlette.requests import Request
from starlette.responses import PlainTextResponse
from starlette.routing import Route

from una_example import greeter


def homepage(_: Request) -> PlainTextResponse:
    msg = greeter.greet("Hello from Una!")
    return PlainTextResponse(msg)


app = Starlette(routes=[Route("/", homepage)])
