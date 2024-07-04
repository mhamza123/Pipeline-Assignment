import pytest
from main import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home(client):
    rv = client.get('/')
    assert rv.data == b'Hello testingg'
