import pandas as pd

file_name = './getdata_data_DATA.gov_NGAP.xlsx'
zip = 'Zip'
ext = 'Ext'

def main():
    df = pd.read_excel(file_name, sheet_name=None)
    a = df['NGAP Sample Data'].loc[16:21, 'Unnamed: 6':'Unnamed: 14']
    columns = a.columns.values
    zipIdx = 0
    extIdx = 0
    for i in range(0, len(a.columns.values)):
        columns[i] = i
    for i in range(0, len(a.columns.values)):
        columns[i] = str(a[i][16]).strip()
        if str(a[i][16]).strip() == zip:
            zipIdx = i
        if str(a[i][16]).strip() == ext:
            extIdx = i
    a = a.loc[17:21]
    sumx = 0
    for i in range(len(a)):
        sumx += a[i:i+1][zipIdx].values[0] * a[i:i+1][extIdx].values[0]
    return sumx


if __name__ == '__main__':
    print(f'Answer for the task2 is: {main()}')
