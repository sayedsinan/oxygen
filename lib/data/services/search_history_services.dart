import 'package:get_storage/get_storage.dart';

class SearchHistoryService {
  static const String _storageKey = 'search_history';
  static const int _maxHistory = 10;
  
  final GetStorage _storage = GetStorage();

  /// Add a search item to history
  Future<void> addToHistory(String query, String type) async {
    if (query.trim().isEmpty) return;

    final history = _getHistory();
    
    // Remove if already exists (to avoid duplicates)
    history.removeWhere((item) => 
      item['query'] == query && item['type'] == type
    );
    
    // Add to beginning
    history.insert(0, {
      'query': query,
      'type': type, // 'patient' or 'doctor'
      'timestamp': DateTime.now().toIso8601String(),
    });
    
    // Keep only last 10 items
    if (history.length > _maxHistory) {
      history.removeRange(_maxHistory, history.length);
    }
    
    await _storage.write(_storageKey, history);
  }

  /// Get all search history
  List<Map<String, dynamic>> getHistory() => _getHistory();

  /// Get history by type
  List<Map<String, dynamic>> getHistoryByType(String type) {
    return _getHistory()
        .where((item) => item['type'] == type)
        .toList();
  }

  /// Clear specific item from history
  Future<void> removeFromHistory(String query, String type) async {
    final history = _getHistory();
    history.removeWhere((item) => 
      item['query'] == query && item['type'] == type
    );
    await _storage.write(_storageKey, history);
  }

  /// Clear all history
  Future<void> clearHistory() async {
    await _storage.remove(_storageKey);
  }

  // Private method to safely read history
  List<Map<String, dynamic>> _getHistory() {
    final data = _storage.read(_storageKey);
    
    if (data == null) return [];
    
    if (data is List) {
      return List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item as Map))
      );
    }
    
    return [];
  }
}
