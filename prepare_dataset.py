import pandas as pd
from tqdm import tqdm

# repeat the same process for posts_test and post_val (in the case that the sklearn library does not do this splitting.)
posts_train_df = pd.read_csv("posts_folder/posts_train.csv")
posts_test_df = pd.read_csv("posts_folder/posts_test.csv")
posts_val_df = pd.read_csv("posts_folder/posts_val.csv")

posts_train_tokens = []
posts_train_target_labels = []

from transformers import DistilBertTokenizer, DistilBertForSequenceClassification
transformer_name = 'distilbert-base-uncased'
tokenizer = DistilBertTokenizer.from_pretrained(transformer_name)
model = DistilBertForSequenceClassification.from_pretrained(transformer_name, num_labels=5)

#for i in tqdm(range(len(posts_train_df.index))):
for index, row in posts_train_df.iterrows():
    #encoded_text = tokenizer.encode(posts_train_df.iloc['post'][i], max_length=512, pad_to_max_length=True)
    encoded_text = tokenizer.encode(row['post'], max_length=512, pad_to_max_length=True)
    if len(encoded_text) != 512:
        encoded_text = encoded_text[:512]
    posts_train_tokens.append(encoded_text)
    posts_train_target_labels.append(row['class_id'])
    

print(f"finished tokenizing")
print(posts_train_tokens[:5])
print(posts_train_target_labels[:5])

# implement multiprocessing after values are loaded onto the
# dataframe to split the training job to multiple cores

'''
    if encoded_text not in posts_train_tokens:
        posts_train_tokens.append(encoded_text)
        posts_train_target_labels.append(row['class_id'])
        print(row['class_id'])
'''


#dummy server, doesn't have anything in it - no instances, firebase, very very VERY dumb chat app - things get stored 
#dummy react app (dumb dumb dumb - homepage basic - dummy stuff sending --)
#finish these requirements for submission