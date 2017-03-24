package com.mirego.cschat.adapters;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.mirego.cschat.R;
import com.mirego.cschat.viewdatas.ConversationViewData;

import java.util.List;

import butterknife.ButterKnife;

public class ConversationAdapter extends RecyclerView.Adapter<ConversationAdapter.ConversationViewHolder> {

    private List<ConversationViewData> conversations;
    private ConversationAdapterListener listener;

    public ConversationAdapter(ConversationAdapterListener listener) {
        this.listener = listener;
    }

    @Override
    public ConversationViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_conversation, parent, false);
        ConversationViewHolder viewHolder = new ConversationViewHolder(view);

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ConversationViewHolder holder, int position) {

    }

    public void populateConversations(List<ConversationViewData> conversations) {
        this.conversations = conversations;
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        if (conversations == null) {
            return 0;
        }
        return conversations.size();
    }

    public static class ConversationViewHolder extends RecyclerView.ViewHolder {


        public ConversationViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }

    }

    public interface ConversationAdapterListener {

        void onConversationClciked(ConversationViewData conversationViewData);

    }

}
