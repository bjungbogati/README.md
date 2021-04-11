

# !pip install saspy


import saspy

sas = saspy.SASsession(java='/home/bjungbogati/anaconda3/bin/java',
# iomhost=['odaws01-apse1.oda.sas.com','odaws02-apse1.oda.sas.com'], 
iomhost=['localhost'],
iomport=11080, encoding='utf-8')


sas
