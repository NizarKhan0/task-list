@extends('layouts.app')

@section('title', 'The list of task')

@section('content')

    <nav class="mb-4">
        <a href="{{ route('tasks.create') }}" class="link">Add Task!</a>
    </nav>

    {{-- @isset($name)
    <div>
        The name is :{{ $name }}
    </div>
@endisset --}}

    {{-- @if (count($tasks)) --}}
    @forelse ($tasks as $task)
        {{-- <div>{{ $task->title }}</div> --}}
        <div>
            <a href="{{ route('tasks.show', ['task' => $task->id]) }}" @class(['line-through' => $task->completed])>{{ $task->title }}</a>
        </div>
    @empty
        <div>No tasks</div>
    @endforelse
    {{-- @endif --}}

    @if ($tasks->count())
        <nav class="m-4">
            {{ $tasks->links() }}
        </nav>
    @endif

@endsection
