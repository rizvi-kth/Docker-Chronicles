import asyncio
import concurrent
import requests
import io
from itertools import groupby
import json

INFERENCE_ENDPOINT = "http://127.0.0.1:8080/predictions/xsumm"

test_sentence = """
Frida Eek tidigare generalsekreterare för Sveriges advokatsamfund säger i en intervju med Aftonbladet att hennes familj hade väldigt lite pengar när hon växte upp på Östermalm. Men som exempel på familjens fattigdom tar Ramberg upp att de sällan åt oxfilé och att mamman promenerade till NK istället för att ta spårvagnen vilket hånas på sociala medier.
Det framgår också i intervjun att Ramberg, som var 18 år gammal år 1970, inte var någon vänsterradikal under det röda 70-talet, utan snarare har radikaliserats idag.
Jag var inte alls sådan, jag har inte haft någon period där jag varit vänsterradikal med studentrevolter. Jag är nog mycket mer så i dag, höll jag på att säga, säger Ramberg till Aftonbladet.
"""

test_sentence2 = """
Römosseskolan en skola med muslimsk inriktning i stadsdelen Gårdsten i Göteborg har bedrivit könsseparerad undervisning sedan skolan startades för 22 år sedan. Bland annat har pojkar och flickor haft separata lektioner i idrott, slöjd och musik, skriver SVT Väst som har tagit del av Skolinspektionens granskning av skolan. 
Utifrån de uppgifter vi har fått har man tillämpat nån typ av könsseparerad undervisning på den här skolan under lång tid ja, säger Frida Eek, jurist vid Skolinspektionen till SVT Väst.
"""


def format_results( entity_names, entity_types):
    assert len(entity_names) == len(entity_types), "Entity list and Entity-type list must be of equal length."

    entity_names_2 = []
    entity_types_2 = []
    [(entity_names_2.append(n), entity_types_2.append(t)) for n, t in zip(entity_names, entity_types) if
     n != "[PAD]"]

    assert len(entity_names_2) == len(entity_types_2)

    # Group same Entity-Types
    groupedLabels = [list(y) for x, y in groupby(entity_types_2)]
    entity_names_2.reverse()

    # Group Entity_Names by Entity-Types
    groupedEntities = []
    for g in groupedLabels:
        groupLocals = []
        for e in g:
            groupLocals.append(entity_names_2.pop())
        groupedEntities.append(groupLocals)
    assert len(groupedEntities) == len(groupedLabels)

    result_dict = {}
    for ent_list, lbl_list in zip(groupedEntities, groupedLabels):
        # print(lbl_list , " >>> " , " ".join(ent_list) )
        if lbl_list[0] not in 'O':
            if lbl_list[0] not in result_dict:
                result_dict[lbl_list[0]] = []

            result_dict[lbl_list[0]].append(" ".join(ent_list))

    # logger.info(f'{">>>" * 20}\n Inference :: {result_dict}')
    return result_dict

def buffer_batch_txt():
    texts_ = [test_sentence, test_sentence2]
    buffer = []
    for txt in texts_:
        output = txt.encode("utf-8", "ignore")
        buffer.append(output)
    return buffer


async def main(loop):
    print("Running batch-inference with 2 sentences. ")

    buffer = buffer_batch_txt()
    executor = concurrent.futures.ThreadPoolExecutor(max_workers=2)
    tasks = [loop.run_in_executor(executor, requests.post, INFERENCE_ENDPOINT, binary_text) for binary_text in buffer]
    responses = await asyncio.gather(*tasks)
    # results = [json.loads(res.text) for res in responses if res.status_code == 200]
    results = [res.text for res in responses if res.status_code == 200]
    print("RAW output : ")
    print(results)
    # print("\n\nFormated output : ")
    # for result in results:
    #     print(format_results(result['tokens'], result['labels']))
    #     print()

    return results


if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main(loop))

