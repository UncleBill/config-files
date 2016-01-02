import urllib2
import json
import os

DEBUG = False
PALY_LIST_URL = 'http://music.163.com/api/playlist/detail?id=%s'
M3U_FILE = os.getenv('HOME') + '/.moc/playlist.m3u'

def fetch_all_urls( id=3811581 ):
    if DEBUG:
        plist = file('list.txt')
    else:
        try:
            plist = urllib2.urlopen( PALY_LIST_URL % id )
        except urllib2.URLError:
            os.system('notify-send "mocp list fetch error!"')
            return []
    if not plist:
        # show_err()
        return []
    plist_dct = json.load(plist)
    tracks = plist_dct['result']['tracks']
    result = []
    for track in tracks:
        result.append(track['mp3Url'])

    return result

def uniq_playlist(pl):
    "uniq and remain the order"
    db = {}
    result = []
    fh = file(M3U_FILE, 'r')
    lst = fh.read().split('\n')
    print 'length of lst:', len(lst)
    lst.extend(pl)
    for url in lst:
        if len(url) is 0 or url[0] is '#':
            continue
        kw = url[24:]
        if kw not in db:
            db[kw] = True
            result.append(url)

    fh.close()
    return result

if __name__ == '__main__':
    # urls = uniq_playlist(fetch_all_urls())
    urls = fetch_all_urls()
    f = file(M3U_FILE,'w')
    f.write('\n'.join(urls))
    f.close()
