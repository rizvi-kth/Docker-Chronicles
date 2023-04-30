import asyncio
import concurrent
import requests
import io

INFERENCE_ENDPOINT = "http://127.0.0.1:8080/predictions/xsenti"
# INFERENCE_ENDPOINT = "http://54.72.170.211:8080/predictions/ensenti"


def buffer_batch_txt():
    texts_ = ["Aäsöop : I am so glad to have you in my home. You are my best friend. I like spending time with my best friend. I am hopping for a good relationship between us.",
              "I dont like their customer support. I was on hold for 40 minutes, their customer support service is a nightmare.",
              "Best place for Bourbon in Atlanta. Great, educated staff. So helpful! Was looking for something different and they helped me greatly.",
              "If someone in your household has Covid-19 symptoms, they should isolate themselves as much as possible within the home and should take a Covid-19 test."]
    buffer = []
    for txt in texts_:
        output = txt.encode("utf-8", "ignore")
        buffer.append(output)
    return buffer


async def main(loop):
    buffer = buffer_batch_txt()
    executor = concurrent.futures.ThreadPoolExecutor(max_workers=1)
    tasks = [loop.run_in_executor(executor, requests.post, INFERENCE_ENDPOINT, pickled_image) for pickled_image in buffer]
    responses = await asyncio.gather(*tasks)
    probs = [res.text for res in responses if res.status_code == 200]
    # probs = [print(res) for res in responses]
    print(probs)
    return probs


if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main(loop))